require("commonrequire")

local GestureRange = require("ui/gesturerange")
local Geom = require("ui/geometry")

describe("gesturerange module", function()
    it("should match tap event within range", function()
        local g = GestureRange:new{
            ges = "tap",
            range = Geom:new{ x = 0, y = 0, w = 200, h = 200},
        }
        assert.truthy(g:match({
            ges = "tap",
            pos = Geom:new{ x = 1, y = 1, w = 0, h = 0 },
        }))
    end)

    it("should not match tap event outside of range", function()
        local g = GestureRange:new{
            ges = "tap",
            range = Geom:new{ x = 0, y = 0, w = 100, h = 100},
        }
        assert.falsy(g:match({
            ges = "tap",
            pos = Geom:new{ x = 105, y = 1, w = 0, h = 0 },
        }))
    end)

    it("should match any event within nil range", function()
        local g = GestureRange:new{
            ges = "tap",
            range = nil,
        }
        assert.truthy(g:match({
            ges = "tap",
            pos = Geom:new{ x = 1, y = 1, w = 1000000000000000000, h = 100 },
        }))
    end)
end)
