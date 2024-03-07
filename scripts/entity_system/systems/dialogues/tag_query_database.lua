-- chunkname: @scripts/entity_system/systems/dialogues/tag_query_database.lua

require("scripts/entity_system/systems/dialogues/tag_query")

TagQueryDatabase = class(TagQueryDatabase)

TagQueryDatabase.init = function (self)
	self.database = RuleDatabase.initialize()
	self.rule_id_mapping = {}
	self.rules_n = 0
	self.contexts_by_object = {}
	self.queries = {}
end

TagQueryDatabase.destroy = function (self)
	RuleDatabase.destroy(self.database)

	self.database = nil
	self.rule_id_mapping = nil
	self.contexts_by_object = nil
	self.queries = nil
end

TagQueryDatabase.add_object_context = function (self, object, context_name, context)
	local object_context_list = self.contexts_by_object[object] or {}

	self.contexts_by_object[object] = object_context_list
	object_context_list[context_name] = context
end

TagQueryDatabase.get_object_context = function (self, object)
	return self.contexts_by_object[object]
end

TagQueryDatabase.remove_object = function (self, object)
	self.contexts_by_object[object] = nil
end

TagQueryDatabase.set_global_context = function (self, context)
	self.global_context = context
end

TagQueryDatabase.create_query = function (self)
	return setmetatable({
		query_context = {},
		tagquery_database = self,
	}, TagQuery)
end

TagQueryDatabase.add_query = function (self, query)
	self.queries[#self.queries + 1] = query
end

TagQueryDatabase.finalize_rules = function (self)
	RuleDatabase.sort_rules(self.database)
end

RuleDatabase.initialize_static_values()

local operator_lookup = {
	EQ = RuleDatabase.OPERATOR_EQUAL,
	LT = RuleDatabase.OPERATOR_LT,
	GT = RuleDatabase.OPERATOR_GT,
	NOT = RuleDatabase.OPERATOR_NOT,
	LTEQ = RuleDatabase.OPERATOR_LTEQ,
	GTEQ = RuleDatabase.OPERATOR_GTEQ,
	NEQ = RuleDatabase.OPERATOR_NOT_EQUAL,
	RAND = RuleDatabase.OPERATOR_RAND,
}
local context_indexes = table.mirror_array_inplace({
	"global_context",
	"query_context",
	"user_context",
	"user_memory",
	"faction_memory",
})
local DEBUG_VO_RULE

TagQueryDatabase.define_rule = function (self, rule_definition)
	local dialogue_name = rule_definition.name

	rule_definition.real_criterias = table.clone(rule_definition.criterias)

	local criterias = {}

	for i = 1, #rule_definition.criterias do
		local criteria = rule_definition.criterias[i]

		self:parse_criteria(criteria, rule_definition.criterias, criterias, rule_definition)
	end

	local num_criterias = #criterias

	rule_definition.n_criterias = num_criterias

	fassert(num_criterias <= (RuleDatabase.RULE_MAX_NUM_CRITERIA or 8), "Too many criteria in dialogue %s", dialogue_name)

	local rule_id = RuleDatabase.add_rule(self.database, dialogue_name, num_criterias, criterias)

	self.rule_id_mapping[rule_id] = rule_definition
	self.rule_id_mapping[rule_definition.name] = rule_id
	self.rules_n = self.rules_n + 1
end

local COMMON_CRITERIA_INDICES = table.mirror_array_inplace({
	"context_name",
	"criteria_key",
	"operator",
})
local CRITERIA_INDICES = table.copy_array(COMMON_CRITERIA_INDICES)

table.mirror_array_inplace(table.append(CRITERIA_INDICES, {
	"value",
	"combining_operator",
}))

local CRITERIA_INDICES_TIMEDIFF = table.copy_array(COMMON_CRITERIA_INDICES)

table.mirror_array_inplace(table.append(CRITERIA_INDICES_TIMEDIFF, {
	"operator",
	"value",
	"combining_operator",
}))

local function criteria_value(criteria, key)
	local index
	local is_time_diff = criteria[COMMON_CRITERIA_INDICES.operator] == "TIMEDIFF"

	if is_time_diff then
		return criteria[CRITERIA_INDICES_TIMEDIFF[key]]
	else
		return criteria[CRITERIA_INDICES[key]]
	end
end

local PARSED_CRITERIA_INDICES = table.mirror_array_inplace({
	"context_name",
	"criteria_key",
	"operator_index",
	"value",
	"has_time_diff",
	"combining_operator_id",
	"combining_operator_group_id",
})

local function find_last_combine_group_id(criterias)
	for i = #criterias, 1, -1 do
		local group_id = criterias[i][PARSED_CRITERIA_INDICES.combining_operator_group_id]

		if group_id ~= 0 then
			return group_id
		end
	end
end

local combined_criteria_lookup = {
	AND_NEXT = RuleDatabase.COMBINING_OPERATOR_AND,
	OR_NEXT = RuleDatabase.COMBINING_OPERATOR_OR,
}

local function get_combining_id_and_group(criteria, combining_operator, previous_criteria, parsed_criterias, rule_definition)
	local previous_parsed_criteria = parsed_criterias[#parsed_criterias]
	local combining_operator_group_id = 0
	local combining_operator_id = combined_criteria_lookup[combining_operator]

	if not combining_operator_id then
		fassert(not combining_operator, "[DialogueSystem] Unknown operator '%s' found in rule '%s'", combining_operator, rule_definition.name)

		local previous_combining_operator = previous_criteria and criteria_value(previous_criteria, "combining_operator")
		local previous_is_combining = previous_combining_operator and previous_combining_operator ~= "AND_NEXT"

		if previous_is_combining then
			combining_operator_id = combined_criteria_lookup.OR_NEXT
			combining_operator_group_id = previous_parsed_criteria[PARSED_CRITERIA_INDICES.combining_operator_group_id]
		else
			combining_operator_id = combined_criteria_lookup.AND_NEXT
		end
	else
		local combined_with_previous = combining_operator == (previous_criteria and criteria_value(previous_criteria, "combining_operator"))

		if combined_with_previous then
			combining_operator_group_id = previous_parsed_criteria[PARSED_CRITERIA_INDICES.combining_operator_group_id]
		elseif combining_operator_id ~= combined_criteria_lookup.AND_NEXT then
			combining_operator_group_id = (find_last_combine_group_id(parsed_criterias) or 0) + 1
		end
	end

	return combining_operator_id, combining_operator_group_id
end

TagQueryDatabase.parse_criteria = function (self, criteria, criterias, parsed_criterias, rule_definition)
	local context_name = criteria[COMMON_CRITERIA_INDICES.context_name]
	local criteria_key = criteria[COMMON_CRITERIA_INDICES.criteria_key]
	local operator = criteria[COMMON_CRITERIA_INDICES.operator]
	local value = criteria_value(criteria, "value")
	local combining_operator = criteria_value(criteria, "combining_operator")
	local has_time_diff = operator == "TIMEDIFF"

	if has_time_diff then
		operator = criteria_value(criteria, "operator")

		fassert(operator_lookup[operator], "No operator besides TIMEDIFF in rule %q", rule_definition.name)
	end

	local operator_index = operator_lookup[operator]

	fassert(operator_index, "No such rule operator named %q in rule %q", tostring(operator), rule_definition.name)
	fassert(context_indexes[context_name], "No such context name %q", context_name)

	local value_type = type(value)

	fassert(value_type == "boolean" or value_type == "string" or value_type == "number", "Unsupported type %s in rule %s", value_type, rule_definition.name)

	if value_type == "boolean" then
		value = value and 1 or 0
	end

	local previous_criteria = criterias[#parsed_criterias]
	local combining_operator_id, combining_operator_group_id = get_combining_id_and_group(criteria, combining_operator, previous_criteria, parsed_criterias, rule_definition)

	parsed_criterias[#parsed_criterias + 1] = {
		[PARSED_CRITERIA_INDICES.context_name] = context_name,
		[PARSED_CRITERIA_INDICES.criteria_key] = criteria_key,
		[PARSED_CRITERIA_INDICES.operator_index] = operator_index,
		[PARSED_CRITERIA_INDICES.value] = value,
		[PARSED_CRITERIA_INDICES.has_time_diff] = has_time_diff,
		[PARSED_CRITERIA_INDICES.combining_operator_id] = combining_operator_id,
		[PARSED_CRITERIA_INDICES.combining_operator_group_id] = combining_operator_group_id,
	}
end

TagQueryDatabase.iterate_queries = function (self, t)
	local num_iterations = #self.queries
	local best_query
	local best_query_value = 0

	for i = 1, num_iterations do
		local query = self:iterate_query(t)
		local result = query.result

		if result then
			local validated_rule = query.validated_rule
			local value = validated_rule.n_criterias

			if best_query_value < value then
				best_query_value = value
				best_query = query
			end
		end
	end

	return best_query
end

local dummy_table = {}

TagQueryDatabase.iterate_query = function (self, t)
	local query = table.remove(self.queries, 1)

	if not query then
		return
	end

	local query_context = query.query_context
	local source = query_context.source
	local user_context_list = self.contexts_by_object[source]

	if user_context_list == nil then
		return query
	end

	local nice_array = {}

	nice_array[1] = self.global_context or dummy_table
	nice_array[2] = query_context or dummy_table
	nice_array[3] = user_context_list.user_context or dummy_table
	nice_array[4] = user_context_list.user_memory or dummy_table
	nice_array[5] = user_context_list.faction_memory or dummy_table

	local rule_index_found = RuleDatabase.iterate_query(self.database, nice_array, t)

	if rule_index_found then
		local rule = self.rule_id_mapping[rule_index_found]

		query.validated_rule = rule
		query.result = rule.response
	end

	return query
end

TagQueryDatabase._debug_print_query = function (self, query, user_context_list, global_context)
	print("--------------- STARTING NEW QUERY ---------------")
	print("Query context:")

	for key, value in pairs(query.query_context) do
		printf("\t%-15s: %-15s", key, tostring(value))
	end

	print("User contexts:")

	for name, context in pairs(user_context_list) do
		print("\t" .. name)

		if type(context) == "table" then
			for key, value in pairs(context) do
				printf("\t\t%-15s : %-15s", key, tostring(value))
			end
		end
	end

	print("Global context:")

	if global_context then
		for key, value in pairs(global_context) do
			printf("\t%-15s : %-15s", key, tostring(value))
		end
	end

	print("--------------- END OF QUERY CONTEXTS ---------------")
end

local dummy_table_2 = {}

TagQueryDatabase.debug_test_query = function (self, concept, source, test_query, test_user_context_list, test_global_context)
	print("--------------- TESTING FOLLOWING QUERY ---------------")
	print(concept, source, test_query, test_user_context_list, test_global_context)
	table.dump(test_query.query_context)

	local Q = self:create_query()
	local unit = Managers.player:local_player().player_unit

	Q:add("concept", concept, "source", unit, "source_name", source)
	Q:finalize()

	local query = self.queries[#self.queries]

	if not query then
		print("FAILED TO CREATE NEW QUERY ", query)

		return
	end

	local query_context = query.query_context
	local query_source = query_context.source
	local user_context_list = table.clone(self.contexts_by_object[query_source])

	for key, value in pairs(test_query.query_context) do
		print(string.format("\t%-15s: %-15s", key, tostring(value)))

		query_context[key] = value
	end

	for name, context in pairs(test_user_context_list) do
		for key, value in pairs(context) do
			print(string.format("\t\t%-15s : %-15s", key, tostring(value)))

			user_context_list[name][key] = value
		end
	end

	if test_global_context then
		for key, value in pairs(test_global_context) do
			print(string.format("\t%-15s : %-15s", key, tostring(value)))

			self.global_context[key] = value
		end
	end

	local query_call = {}

	query_call[1] = self.global_context or dummy_table_2
	query_call[2] = query_context or dummy_table_2
	query_call[3] = user_context_list.user_context or dummy_table_2
	query_call[4] = user_context_list.user_memory or dummy_table_2
	query_call[5] = user_context_list.faction_memory or dummy_table_2

	local t = Managers.time:time("game")
	local rule_index_found = RuleDatabase.iterate_query(self.database, query_call, t)

	if rule_index_found then
		local rule = self.rule_id_mapping[rule_index_found]

		query.validated_rule = rule
		query.result = rule.response

		print("Following rule succeeded:", query.result)
	else
		print("Failed testing query")
	end

	print("--------------- END OF TEST QUERY---------------")
end
