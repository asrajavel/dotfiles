-- Function to execute a command and capture its output
local function executeCommand(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

local function runPythonScriptForTotp(totpName)
    local pythonCommand = "/Users/rajavel.as/shieldProjects/k8Selector/venv/bin/python /Users/rajavel.as/.hammerspoon/totp.py " .. totpName
    --totpName is passed as an argument to the python script
    local output = executeCommand(pythonCommand)
    hs.notify.new({title="Yay!", informativeText="TOTP Autofilled"}):send()
    hs.eventtap.keyStrokes(output)
end

hs.hotkey.bind({}, "f13", function()
    runPythonScriptForTotp("rajavel_microsoft_totp")
    hs.eventtap.keyStroke({}, "return")
end)

hs.hotkey.bind({}, "f14", function()
    hs.eventtap.keyStroke({}, "2")
    hs.timer.usleep(200000) -- pause for 200ms
    hs.eventtap.keyStroke({}, "return")
    runPythonScriptForTotp("rajavel_authn_totp")
    hs.eventtap.keyStroke({}, "return")
end)