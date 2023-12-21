local hyper = {"cmd", "alt", "ctrl", "shift"}

hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)

hs.notify.new({
  title="Hammerspoon",
  informativeText="Config has been reloaded."
}):send()

local applicationHotkeys = {
  f = "Google Chrome",
  g = "Firefox",
  u = "Slack",

  t = "iTerm",
  y = "IntelliJ IDEA CE",
  p = "Postman",
  o = "Sequel Ace",

  b = "calibre"
}
--
--for key, app in pairs(applicationHotkeys) do
--  hs.hotkey.bind(hyper, key, function()
--    hs.application.launchOrFocus(app)
--  end)
--end
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
