a drawing library for roblox


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
    collor       -- Color3     default: Color3.fromRGB(255,255,255)
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
    zindex = 0,
    thickness = 1,
    transparency = 0,
    color = Color3.fromRGB(200, 0, 0), -- red

    from = Vector2.new(100, 100),
    to = Vector2.new(200, 200)
})
```
