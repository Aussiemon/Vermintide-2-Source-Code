require("scripts/entity_system/systems/dialogues/tag_query")

local requested_debug_rules = Development.parameter("dialogue_debug_rules")
TagQueryDatabase = class(TagQueryDatabase)

function DebugPrintQuery(query, user_context_list, global_context)
	print("--------------- STARTING NEW QUERY ---------------")
	print("Query context:")

	for key, value in pairs(query.query_context) do
		print(string.format("\t%-15s: %-15s", key, tostring(value)))
	end

	print("User contexts:")

	for name, context in pairs(user_context_list) do
		print("\t" .. name)

		if type(context) == "table" then
			for key, value in pairs(context) do
				print(string.format("\t\t%-15s : %-15s", key, tostring(value)))
			end
		end
	end

	print("Global context:")

	if global_context then
		for key, value in pairs(global_context) do
			print(string.format("\t%-15s : %-15s", key, tostring(value)))
		end
	end

	print("--------------- END OF QUERY CONTEXTS ---------------")
end

if not rawget(_G, "RuleDatabase") then
	assert(false, "You are running the game without the rule database plugin!")

	TagQueryDatabase.init = function (self)
		self.rules = {}
		self.rules_n = 0
		self.contexts_by_object = {}
		self.global_context = nil
		self.queries = {}
	end

	TagQueryDatabase.destroy = function (self)
		return
	end

	TagQueryDatabase.create_query = function (self)
		return setmetatable({
			query_context = {},
			tagquery_database = self
		}, TagQuery)
	end

	local function sort_function(lhs, rhs)
		return rhs.n_criterias < lhs.n_criterias
	end

	TagQueryDatabase.finalize_rules = function (self)
		table.sort(self.rules, sort_function)
	end

	TagQueryDatabase.add_object_context = function (self, object, context_name, context)
		local object_context_list = self.contexts_by_object[object] or {}
		self.contexts_by_object[object] = object_context_list
		object_context_list[context_name] = context
	end

	TagQueryDatabase.remove_object = function (self, object)
		self.contexts_by_object[object] = nil
	end

	TagQueryDatabase.set_global_context = function (self, context)
		self.global_context = context
	end

	TagQueryDatabase.add_query = function (self, query)
		self.queries[#self.queries + 1] = query
	end

	TagQueryDatabase.define_rule = function (self, rule)
		local rules_n = self.rules_n
		rules_n = rules_n + 1
		self.rules[rules_n] = rule
		self.rules_n = rules_n
		rule.n_criterias = #rule.criterias
	end

	local LOCAL_GAMETIME = 0
	local function_by_op = {
		[TagQuery.OP.EQ] = function (lhs, rhs)
			return (lhs == rhs and lhs) or nil
		end,
		[TagQuery.OP.NEQ] = function (lhs, rhs)
			return (lhs ~= rhs and true) or false
		end,
		[TagQuery.OP.LT] = function (lhs, rhs)
			return rhs > (lhs or 0) and rhs
		end,
		[TagQuery.OP.GT] = function (lhs, rhs)
			return rhs < (lhs or 0) and rhs
		end,
		[TagQuery.OP.LTEQ] = function (lhs, rhs)
			return (lhs <= rhs and rhs) or nil
		end,
		[TagQuery.OP.GTEQ] = function (lhs, rhs)
			return (rhs <= lhs and rhs) or nil
		end,
		[TagQuery.OP.ADD] = function (lhs, rhs)
			return lhs + rhs
		end,
		[TagQuery.OP.SUB] = function (lhs, rhs)
			return lhs - rhs
		end,
		[TagQuery.OP.NUMSET] = function (lhs, rhs)
			return rhs or 0
		end,
		[TagQuery.OP.NOT] = function (value)
			return not value
		end,
		[TagQuery.OP.RAND] = function (value)
			return math.random() <= value
		end,
		[TagQuery.OP.TIMEDIFF] = function (value)
			return -((value or 0) - LOCAL_GAMETIME)
		end
	}

	local function debug_print_criteria(criteria)
		local text = ""

		for _, crit in ipairs(criteria) do
			text = text .. tostring(crit) .. " "
		end

		print(text)
	end

	TagQueryDatabase.iterate_queries = function (self, t)
		local num_iterations = #self.queries
		local best_query = nil
		local best_query_value = 0

		for i = 1, num_iterations, 1 do
			local query = self:iterate_query(t)
			local result = query.result

			if result then
				local validated_rule = query.validated_rule
				local value = validated_rule.n_criterias

				if best_query_value < value then
					value = best_query_value
					best_query = query
				end
			end
		end

		return best_query
	end

	local iterate_context = {}

	TagQueryDatabase.iterate_query = function (self, t)
		LOCAL_GAMETIME = t
		local DEBUG_QUERY = script_data.dialogue_debug_queries
		local DEBUG_CRITERIA_FAIL = script_data.dialogue_debug_criterias
		local DEBUG_CRITERIA_SUCCESS = script_data.dialogue_debug_criterias
		local DEBUG_EXTRACT_SIMPLE = false
		local DEBUG_RULE_FAIL = script_data.dialogue_debug_rule_fails
		local query = table.remove(self.queries, 1)

		if not query then
			return
		end

		local query_context = query.query_context
		local source = query_context.source
		local user_context_list = self.contexts_by_object[source]
		local current_context = iterate_context

		if DEBUG_QUERY then
			DebugPrintQuery(query, user_context_list, self.global_context)
		end

		current_context.query_context = query_context

		for name, context in pairs(user_context_list) do
			current_context[name] = context
		end

		current_context.global_context = self.global_context
		local rules = self.rules
		local result, success_rule = nil

		for i, rule in ipairs(rules) do
			local criterias = rule.criterias
			local success = true

			for j = 1, rule.n_criterias, 1 do
				local current_criteria = criterias[j]
				local crit_index = 1
				local current_table, lhs_value, current_value, current_op = nil

				while current_criteria[crit_index] do
					local current_criteria_eval = current_criteria[crit_index]
					crit_index = crit_index + 1
					local eval_type = type(current_criteria_eval)

					if eval_type == "string" then
						current_table = (current_table and current_table[current_criteria_eval]) or current_context[current_criteria_eval]

						if current_value then
							current_value = current_table
						else
							current_value = current_criteria_eval
						end
					elseif eval_type == "table" then
						if current_op then
							local op_result = function_by_op[current_op](lhs_value, current_value)

							if (DEBUG_CRITERIA_FAIL and not op_result) or (DEBUG_CRITERIA_SUCCESS and op_result) then
								print(string.format("Rule %q Criteria %q LHS: %s OP: %s RHS: %s Result %s", rule.name, j, tostring(lhs_value), tostring(current_op), tostring(current_value), tostring(op_result)))
							end

							if not op_result then
								lhs_value = nil
								current_op = nil
								current_value = nil

								break
							end

							lhs_value = op_result
							current_op = current_criteria_eval
							current_table = nil
							current_value = nil
						elseif lhs_value then
							current_op = current_criteria_eval

							assert(not current_value, "Fail in rule-analyze logic.")
						else
							lhs_value = current_value
							current_table = nil
							current_value = nil
							current_op = current_criteria_eval
						end
					else
						current_value = current_criteria_eval
					end
				end

				if lhs_value and current_op then
					local op_result = function_by_op[current_op](lhs_value, current_value)

					if (DEBUG_CRITERIA_FAIL and not op_result) or (DEBUG_CRITERIA_SUCCESS and op_result) then
						print(string.format("Rule %q Criteria %d LHS: %s RHS: %s Operator %s Result %s", rule.name, j, tostring(lhs_value), tostring(current_value), tostring(current_op), tostring(op_result)))
					end

					if not op_result then
						success = false
						j = math.huge
					end
				elseif current_op then
					local op_result = nil

					if crit_index > 4 then
						op_result = function_by_op[current_op](lhs_value, current_value)
					else
						op_result = function_by_op[current_op](current_value)
					end

					if not op_result then
						success = false
						j = math.huge
					end

					if (DEBUG_CRITERIA_FAIL and not op_result) or (DEBUG_CRITERIA_SUCCESS and op_result) then
						print(string.format("Rule %q Criteria %d Value: %s Operator %s Result %s", rule.name, j, tostring(current_value), tostring(current_op), tostring(op_result)))
					end
				else
					if DEBUG_RULE_FAIL then
						print(string.format("Rule %q Criteria %d failed. LHS: %s RHS: %s operator %s", rule.name, j, tostring(lhs_value), tostring(current_value), tostring(current_op)))
					end

					if DEBUG_CRITERIA_FAIL then
						debug_print_criteria(current_criteria)
					end

					success = false
					j = rule.n_criterias
				end
			end

			if success then
				result = rule.response
				success_rule = rule

				if script_data.dialogue_debug_queries then
					print(string.format("Query Succeeded, result rule %s after %d rule iterations.", result, i))
				end

				break
			end
		end

		query.completed = true
		query.result = result
		query.validated_rule = success_rule

		for name, context in pairs(user_context_list) do
			current_context[name] = nil
		end

		current_context.global_context = nil

		return query
	end

	return
end

TagQueryDatabase.init = function (self)
	self.database = RuleDatabase.initialize(4096)
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

TagQueryDatabase.remove_object = function (self, object)
	self.contexts_by_object[object] = nil
end

TagQueryDatabase.set_global_context = function (self, context)
	self.global_context = context
end

TagQueryDatabase.create_query = function (self)
	return setmetatable({
		query_context = {},
		tagquery_database = self
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
	RAND = RuleDatabase.OPERATOR_RAND
}
local context_indexes = table.mirror_array_inplace({
	"global_context",
	"query_context",
	"user_context",
	"user_memory",
	"faction_memory"
})

TagQueryDatabase.define_rule = function (self, rule_definition)
	local dialogue_name = rule_definition.name

	if dialogue_name == "egs_level_skittergate_rasknitt_appears" then
		print("uheuhe")
	end

	local criterias = rule_definition.criterias
	local real_criterias = table.clone(criterias)
	rule_definition.real_criterias = real_criterias
	local num_criterias = #criterias
	local context_indexes = context_indexes
	rule_definition.n_criterias = num_criterias

	assert(num_criterias <= (RuleDatabase.RULE_MAX_NUM_CRITERIA or 8), "Too many criteria in dialogue %s", dialogue_name)

	for i = 1, num_criterias, 1 do
		local criteria = criterias[i]
		local context_name = criteria[1]

		assert(context_indexes[context_name], "No such context name %q", context_name)

		local operator = criteria[3]
		local value = nil

		if operator == "TIMEDIFF" then
			operator = criteria[4]

			assert(operator, "No operator besides TIMEDIFF in rule %q", rule_definition.name)

			value = criteria[5]
			criteria[5] = true
		else
			value = criteria[4]
			criteria[5] = false
		end

		local operator_index = operator_lookup[operator]

		assert(operator_index, "No such rule operator named %q in rule %q", tostring(operator), rule_definition.name)

		criteria[3] = operator_index
		local value_type = type(value)

		if value_type == "string" then
			criteria[4] = value
		elseif value_type == "boolean" then
			if value then
				value = 1
			else
				value = 0
			end

			criteria[4] = value
		else
			assert(value_type == "number")

			criteria[4] = value
		end
	end

	local rule_id = RuleDatabase.add_rule(self.database, dialogue_name, num_criterias, criterias)
	self.rule_id_mapping[rule_id] = rule_definition
	self.rule_id_mapping[rule_definition.name] = rule_id
	self.rules_n = self.rules_n + 1
end

TagQueryDatabase.iterate_queries = function (self, t)
	local num_iterations = #self.queries
	local best_query = nil
	local best_query_value = 0

	for i = 1, num_iterations, 1 do
		local query = self:iterate_query(t)
		local result = query.result

		if result then
			local validated_rule = query.validated_rule
			local value = validated_rule.n_criterias

			if best_query_value < value then
				value = best_query_value
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

	local DEBUG_QUERY = script_data.dialogue_debug_queries

	if DEBUG_QUERY then
		DebugPrintQuery(query, user_context_list, self.global_context)
	end

	local nice_array = {
		self.global_context or dummy_table,
		query_context or dummy_table,
		user_context_list.user_context or dummy_table,
		user_context_list.user_memory or dummy_table,
		user_context_list.faction_memory or dummy_table
	}
	local rule_index_found = RuleDatabase.iterate_query(self.database, nice_array, t)

	if rule_index_found then
		local rule = self.rule_id_mapping[rule_index_found]
		query.validated_rule = rule
		query.result = rule.response
	end

	return query
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

	local query = self.queries[1]

	if not query then
		print("FAILED TO CREATE NEW QUERY ", query)

		return
	end

	local query_context = query.query_context
	local source = query_context.source
	local user_context_list = self.contexts_by_object[source]

	for key, value in pairs(test_query.query_context) do
		print(string.format("\t%-15s: %-15s", key, tostring(value)))

		query_context[key] = value
	end

	for name, context in pairs(test_user_context_list) do
		for key, value in pairs(context) do
			print(string.format("\t\t%-15s : %-15s", key, tostring(value)))

			user_context_list[key] = value
		end
	end

	if test_global_context then
		for key, value in pairs(test_global_context) do
			print(string.format("\t%-15s : %-15s", key, tostring(value)))

			self.global_context[key] = value
		end
	end

	local query_call = {
		self.global_context or dummy_table_2,
		query_context or dummy_table_2,
		user_context_list.user_context or dummy_table_2,
		user_context_list.user_memory or dummy_table_2,
		user_context_list.faction_memory or dummy_table_2
	}
	local t = Managers.time:time("game")
	local rule_index_found = RuleDatabase.iterate_query(self.database, query_call, t)

	if rule_index_found then
		local rule = self.rule_id_mapping[rule_index_found]
		query.validated_rule = rule
		query.result = rule.response

		print("Following rule succeeded: ", query.result)
	else
		print("Failed testing query")
	end

	self.queries[1] = query

	print("--------------- END OF TEST QUERY---------------")
end
