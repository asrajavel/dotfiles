local hyper = {"cmd", "alt", "ctrl", "shift"}

hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)

hs.hotkey.bind(hyper, ";", function()
    moveMouseToMiddleOfActiveApplication()
end)

function moveMouseToMiddleOfActiveApplication()
    local app = hs.application.frontmostApplication()
    hs.notify.new({title="Notification", informativeText="Active Application: " .. app:title()}):send()
    moveMouseToMiddle(app)
end

hs.notify.new({
  title="Hammerspoon",
  informativeText="Config has been reloaded."
}):send()

local applicationHotkeys = {
    w = "Finder",
    e = "Vial",
    r = "Activity Monitor",

    s = "Slack",
    d = "Google Chrome",
    f = "Firefox",

    z = "PyCharm CE",
    x = "Postman",
    v = "com.googlecode.iterm2",
    c = "com.jetbrains.intellij.ce",
    b = "Sequel Ace"
}

for key, app in pairs(applicationHotkeys) do
    hs.hotkey.bind(hyper, key, function()
        -- Launch or focus the application, this logic is required for some applications like intellij and iterm
        if string.match(app, "%.") then
            -- Launch or focus the application by bundle ID
            hs.application.launchOrFocusByBundleID(app)
        else
            -- Launch or focus the application by name
            hs.application.launchOrFocus(app)
        end

        local appObj = hs.application.get(app)
        moveMouseToMiddle(appObj)
    end)
end

function moveMouseToMiddle(appObj)
    if appObj then
        local mainWindow = appObj:mainWindow()

        if mainWindow then
            local winFrame = mainWindow:frame()

            -- Calculate the middle point of the frame
            local middleX = winFrame.x + winFrame.w / 2
            local middleY = winFrame.y + winFrame.h / 2

            hs.mouse.setAbsolutePosition({x = middleX, y = middleY})
        end
    else
        print("Error: Could not get application object for " .. app)
    end
end

-- Function to move mouse pointer to the middle of a specific screen
--function moveMouseToMiddle(screenIndex)
--  local screens = hs.screen.allScreens()
--
--  -- Check if the specified index is valid
--  if screenIndex >= 1 and screenIndex <= #screens then
--    local currentScreen = screens[screenIndex]
--    local screenFrame = currentScreen:fullFrame()
--
--    local middleX = screenFrame.w / 2
--    local middleY = screenFrame.h / 2
--
--    hs.mouse.setAbsolutePosition({x = screenFrame.x + middleX, y = screenFrame.y + middleY})
--    --hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, {x = screenFrame.x + middleX, y = screenFrame.y + middleY}):post()
--    --hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, {x = screenFrame.x + middleX, y = screenFrame.y + middleY}):post()
--  else
--    hs.alert.show("Invalid screen index")
--  end
--end

-- Bind the function to a hotkey for each monitor (customize the keys as needed)
--hs.hotkey.bind(hyper, "1", function() moveMouseToMiddle(1) end) -- Move to middle of screen 1
--hs.hotkey.bind(hyper, "2", function() moveMouseToMiddle(2) end) -- Move to middle of screen 2
--hs.hotkey.bind(hyper, "3", function() moveMouseToMiddle(3) end) -- Move to middle of screen 3
-- Add more hotkeys for additional monitors as needed

-- Notify when the script is loaded
hs.notify.new({title="Hammerspoon", informativeText="Mouse to Middle script loaded"}):send()

--function moveFocusedAppToScreen(screenId)
--    -- Get the currently focused window
--    local win = hs.window.focusedWindow()
--
--    -- Get all screens
--    local screens = hs.screen.allScreens()
--
--    -- Check if the specified screenId is valid
--    if screenId >= 1 and screenId <= #screens then
--        -- Get the target screen
--        local targetScreen = screens[screenId]
--
--        -- Move the window to the target screen
--        win:moveToScreen(targetScreen)
--        win:maximize()
--    else
--        hs.alert.show("Invalid screen ID")
--    end
--    hs.timer.doAfter(0.6, function()
--        -- Code to execute after 1 second delay
--        moveMouseToMiddleOfActiveApplication(screenId)
--    end)
--end
--
--hs.hotkey.bind(hyper, "4", function() moveFocusedAppToScreen(1) end)
--hs.hotkey.bind(hyper, "5", function() moveFocusedAppToScreen(2) end)
--hs.hotkey.bind(hyper, "6", function() moveFocusedAppToScreen(3) end)

function moveFocusedAppToScreen(direction)
    -- Get the currently focused window
    local win = hs.window.focusedWindow()

    -- Get the screen of the currently focused window
    local currentScreen = win:screen()

    -- Get the target screen based on the direction
    local targetScreen = nil
    if direction == "left" then
        targetScreen = currentScreen:toWest()
    elseif direction == "right" then
        targetScreen = currentScreen:toEast()
    end

    -- If a target screen was found, move the window to the target screen
    if targetScreen then
        win:moveToScreen(targetScreen)
        win:maximize()
        hs.timer.doAfter(0.6, function()
            -- Code to execute after 0.6 second delay
            moveMouseToMiddleOfActiveApplication()
        end)
    else
        hs.alert.show("No screen found in the " .. direction .. " direction")
    end
end

hs.hotkey.bind(hyper, "4", function() moveFocusedAppToScreen("left") end)
hs.hotkey.bind(hyper, "5", function() moveFocusedAppToScreen("right") end)

--
--left_monitor = hs.screen.allScreens()[1]
--right_monitor = hs.screen.allScreens()[2]
--
--intelliJ = hs.application.get('IntelliJ IDEA')
--
--coding_layout= {
--  {intelliJ, nil, left_monitor, hs.layout.maximized, nil, nil},
--  {"Postman", nil, right_monitor, hs.layout.maximized, nil, nil},
--}
--
--hs.hotkey.bind(hyper, '[', function()
--
--  hs.application.launchOrFocus('Postman')
--  hs.application.launchOrFocus('IntelliJ IDEA CE')
--  hs.layout.apply(coding_layout)
--end)
--
--hs.hotkey.bind(hyper, "v", function()
--  hs.eventtap.keyStroke({"cmd", "shift"}, "v")
--  hs.timer.doAfter(0.05, function()
--    hs.eventtap.keyStroke({}, "down")
--    hs.eventtap.keyStroke({}, "return")
--  end)
--end)
--
--hs.hotkey.bind(hyper, "c", function()
--  hs.eventtap.keyStroke({"shift"}, "return")
--  hs.eventtap.keyStrokes("``` ")
--  hs.eventtap.keyStroke({"cmd"}, "v")
--  hs.eventtap.keyStrokes(" ```")
--end)
--
--hs.hotkey.bind(hyper, "f", function()
--  hs.eventtap.keyStroke({"cmd"}, "c")
--  hs.eventtap.keyStroke({"cmd"}, "f")
--  hs.eventtap.keyStroke({"cmd"}, "v")
--  hs.eventtap.keyStroke("return")
--end)
--
--hs.hotkey.bind(hyper, "g", function()
--  hs.eventtap.keyStrokes(" | grep '")
--  hs.eventtap.keyStroke({"cmd"}, "v")
--  hs.eventtap.keyStrokes("'")
--  hs.eventtap.keyStroke("return")
--  hs.eventtap.keyStroke("return")
--end)
--
--local keyCodeEnter = 36 -- Virtual key code for the Enter key
--
--hs.hotkey.bind(hyper, "r", function()
--  for i = 1, 30 do
--    hs.eventtap.event.newKeyEvent({}, keyCodeEnter, true):post()
--    hs.eventtap.event.newKeyEvent({}, keyCodeEnter, false):post()
--  end
--end)
--
--hs.hotkey.bind(hyper, "z", function()
--  hs.eventtap.keyStroke({"option"}, "right")
--  hs.eventtap.keyStroke({"option"}, "right")
--  hs.eventtap.keyStroke({"option"}, "right")
--  hs.eventtap.keyStroke({"option"}, "right")
--  hs.eventtap.keyStroke({"option"}, "right")
--  hs.eventtap.keyStroke({"option"}, "right")
--  hs.eventtap.keyStroke({"option", "shift"}, "right")
--  hs.eventtap.keyStroke({"option", "shift"}, "right")
--  hs.eventtap.keyStroke({"option", "shift"}, "right")
--  hs.eventtap.keyStroke({"cmd"}, "v")
--end)
