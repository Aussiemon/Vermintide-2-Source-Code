DeadlockStack = DeadlockStack or {
	n = 0
}

DeadlockStack.pause = function ()
	if DeadlockStack.n == 0 then
		Deadlock.pause()
	end

	DeadlockStack.n = DeadlockStack.n + 1
end

DeadlockStack.unpause = function ()
	DeadlockStack.n = DeadlockStack.n - 1

	assert(DeadlockStack.n >= 0, "DeadlockStack underflow")

	if DeadlockStack.n == 0 then
		Deadlock.unpause()
	end
end
