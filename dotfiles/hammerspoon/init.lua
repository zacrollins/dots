-- luacheck: globals hs spoon hyper nohyper
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
local Install=spoon.SpoonInstall

hyper = {"cmd", "alt", "ctrl", "shift"}
nohyper = {"alt"}

Install:installSpoonFromZipURL('https://github.com/mattorb/MenuHammer/raw/master/Spoons/MenuHammer.spoon.zip')
local menuHammer = hs.loadSpoon("MenuHammer")
menuHammer:enter()

Install:updateRepo('default')
Install:installSpoonFromRepo('Emojis')
Install:installSpoonFromRepo('KSheet')

local sheet = hs.loadSpoon('KSheet')
sheet:bindHotkeys({toggle={hyper, 'p'}})
local emojis = hs.loadSpoon('Emojis')
emojis.chooser:rows(15)
emojis:bindHotkeys({toggle={hyper, 'e'}})

-- Use Hyper+0 to reload Hammerspoon config
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, '0', nil, function()
  hs.reload()
end)

require('hyper')
require('windows')


-- working around some new os x nuance where this preference is not successfully preserved in the plist
--  after a relaunch of hammerspoonf
if hs.dockicon.visible() then
    hs.dockicon.hide()
end

require('menusearch')

hs.notify.new({title='Hammerspoon', informativeText='Ready to rock 🤘'}):send()
