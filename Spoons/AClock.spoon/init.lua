--- === AClock ===
---
--- Just another clock, floating above all
---
--- Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/AClock.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/AClock.spoon.zip)

local obj={}
obj.__index = obj

-- Metadata
obj.name = "AClock"
obj.version = "1.0"
obj.author = "ashfinal <ashfinal@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()
    self.canvas = hs.canvas.new({x=0, y=0, w=0, h=0}):show()
    self.canvas[1] = {
        type = "text",
        text = "",
        textFont = "Impact",
        textSize = 65,
        textColor = {hex="#1891C3"},
        textAlignment = "center",
    }
end

--- AClock:toggleShow()
--- Method
--- Show AClock, if already showing, just hide it.
---

function obj:toggleShow()
    if self.timer then
        self.timer:stop()
        self.timer = nil
        self.canvas:hide()
    else
        local mainScreen = hs.screen.mainScreen()
        local mainRes = mainScreen:fullFrame()
        self.canvas:frame({
            x = (mainRes.w-600)/2,
            y = (mainRes.h-130)/2,
            w = 600,
            h = 130
        })
        self.canvas[1].text = os.date("%Y-%m-%d %H:%M")
        self.canvas:show()
        self.timer = hs.timer.doAfter(4, function()
            self.canvas:hide()
            self.timer = nil
        end)
    end
end

return obj
