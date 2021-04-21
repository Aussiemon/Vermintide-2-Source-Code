local schema = Schema.define
local TALENT_TREE_SCHEMA = schema("TALENT_TREE_SCHEMA", {
	type = "table",
	table_values = {
		type = "table",
		table_array = {
			type = "table",
			length = NumTalentRows,
			table_array = {
				type = "table",
				length = NumTalentColumns,
				table_array = {
					type = "string",
					key = TalentIDLookup
				}
			}
		}
	}
})

Schema.validate(TALENT_TREE_SCHEMA, TalentTrees, "TalentTrees")

local valid_buffers = {
	"server",
	"client",
	"both"
}
local TALENT_SCHEMA = schema("TALENT_SCHEMA", {
	type = "table",
	table_values = {
		type = "table",
		table_array = {
			strict = true,
			type = "table",
			map = {
				name = {
					required = true,
					type = "string"
				},
				description = {
					required = true,
					type = "string"
				},
				description_values = {
					type = "table"
				},
				icon = {
					type = "string",
					key = UIAtlasHelper._ui_atlas_settings
				},
				buffs = {
					type = "table",
					table_array = {
						type = "string",
						key = BuffTemplates
					}
				},
				client_buffs = {
					type = "table",
					table_array = {
						type = "string",
						key = BuffTemplates
					}
				},
				server_buffs = {
					type = "table",
					table_array = {
						type = "string",
						key = BuffTemplates
					}
				},
				num_ranks = {
					min = 1,
					type = "number"
				},
				buffer = {
					type = "string",
					enum = valid_buffers
				},
				perks = {
					type = "table",
					table_array = {
						type = "string"
					}
				},
				talent_career_skill_index = {
					type = "number"
				},
				talent_career_weapon_index = {
					type = "number"
				},
				tree = {
					type = "number"
				},
				row = {
					type = "number",
					required_if = {
						tree = true
					}
				},
				coulumn = {
					type = "number",
					required_if = {
						tree = true
					}
				},
				talent_id = {
					type = "number",
					required_if = {
						tree = true
					}
				}
			}
		}
	}
})

Schema.validate(TALENT_SCHEMA, Talents, "Talents")

local TALENT_BUFF_TEMPLATE_SCHEMA = schema("TALENT_BUFF_TEMPLATE_SCHEMA", {
	type = "table",
	table_values = {
		type = "table",
		table_values = {
			strict = true,
			type = "table",
			map = {
				activation_sound = {
					type = "string"
				},
				deactivation_sound = {
					type = "string"
				},
				activation_effect = {
					type = "string"
				},
				deactivation_effect = {
					type = "string"
				},
				buffs = {
					length = 1,
					type = "table",
					table_array = {
						type = "table",
						map = {
							name = {
								required = true,
								type = "string"
							},
							icon = {
								type = "string"
							},
							priority_buff = {
								type = "boolean"
							},
							duration = {
								type = "number"
							},
							perk = {
								type = "string"
							},
							apply_buff_func = {
								type = "string",
								key = BuffFunctionTemplates.functions
							},
							remove_buff_func = {
								type = "string",
								key = BuffFunctionTemplates.functions
							},
							event_buff = {
								type = "boolean"
							},
							event = {
								type = "string",
								required_if = {
									event_buff = true
								},
								enum = ProcEvents
							},
							buff_func = {
								type = "string",
								required_if = {
									event_buff = true
								},
								key = ProcFunctions
							},
							proc_chance = {
								max = 1,
								min = 0,
								type = "number"
							},
							remove_on_proc = {
								type = "boolean"
							},
							stat_buff = {
								type = "string",
								key = StatBuffApplicationMethods
							},
							bonus = {
								type = "number"
							},
							multiplier = {
								type = "number"
							},
							lerp_time = {
								type = "number"
							},
							path_to_movement_setting_to_modify = {
								type = "table",
								table_array = {
									type = "string"
								}
							},
							update_frequency = {
								min = 0,
								type = "number"
							},
							update_func = {
								type = "string",
								key = BuffFunctionTemplates.functions
							},
							on_max_stacks_func = {
								type = "string",
								key = MaxStackFunctions
							},
							max_stack_data = {
								type = "table",
								required_if = {
									on_max_stacks_func = true
								}
							},
							buff_on_stacks = {
								min = 1,
								type = "number"
							},
							max_stacks = {
								type = "number"
							},
							reset_on_max_stacks = {
								type = "boolean"
							},
							refresh_durations = {
								type = "boolean"
							},
							particles = {
								type = "table",
								table_array = {
									strict = true,
									type = "table",
									map = {
										effect = {
											required = true,
											type = "string"
										},
										link_node = {
											type = "string"
										},
										orphaned_policy = {
											required = true,
											type = "string"
										},
										destroy_policy = {
											required = true,
											type = "string"
										},
										first_person = {
											required = true,
											type = "boolean"
										},
										third_person = {
											required = true,
											type = "boolean"
										},
										continuous = {
											required = true,
											type = "boolean"
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
})

Schema.validate(TALENT_BUFF_TEMPLATE_SCHEMA, TalentBuffTemplates, "TalentBuffTemplates")

return
