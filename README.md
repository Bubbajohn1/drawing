a drawing library for roblox made for people like me who cant figure out synapse x drawing lib.

## why use this over synapse x drawing lib?
* 1: Its easier to understand
* 2: Its built with more features
* 3: uhhhh because

## getting started 
import it to your lua script by pasting this somewhere:
```lua
local drawing = loadstring(game:HttpGet("https://raw.githubusercontent.com/Bubbajohn1/vamp.drawing/main/main.lua"))
```

## usage
### lines
```lua
drawing.new("line", {
    visible      -- bool       default: true
    color        -- Color3     default: Color3.fromRGB(255,255,255)
    zindex       -- i32/number default: 0
    thickness    -- i32/number default: 1
    transparency -- i32/number default: 0
    
    from         -- Vector2    NEEDED (no default)
    to           -- Vector2    NEEDED (no default)
})
```

#### example:
```lua
drawing.new("line", {
    visible = true,
    color = Color3.fromRGB(200, 0, 0) -- dark red
    zindex = 0,
    thickness = 1,
    transparency = 0,

    from = Vector2.new(100, 100),
    to = Vector2.new(200, 200)
})
```
