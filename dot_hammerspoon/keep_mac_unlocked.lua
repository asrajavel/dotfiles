local task = require("hs.task")

local caffeinateTask = task.new("/usr/bin/caffeinate", nil, {})
caffeinateTask:start()

-- Stop the timer when Hammerspoon exits
hs.shutdownCallback = function()
    caffeinateTask:terminate()
end
