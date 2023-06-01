a drawing library for roblox made for people like me who cant figure out synapse x drawing lib.
this is basically just the synapse x drawing lib but made with roblox gui stuff

## why use this over other drawing libs?
* 1: Its easier to understand
* 2: Its built with more features
* 3: idk

## features
* 1: table to store all drawings, hidden objects, and signals
* 2: built in signal support
* 3: built in utility

## getting started 
import it to your script by pasting this somewhere:
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
### text

#### Fonts:
* 0 Roboto
* 1 Arial
* 2 Code
* 3 RobotoMono

```lua
drawing.new("text", {
    visible       -- bool       default: true
    color         -- Color3     default: Color3.fromRGB(255,255,255)
    zindex        -- i32/number default: 0
    transparency  -- i32/number default: 0
    text          -- string     default: "label"
    size          -- i32/number default 16
    center        -- bool       default false
    outline       -- bool       default false
    outline_color -- Color3     default Color3.fromRGB(0, 0, 0)
        
    position      -- Vector2    NEEDED (no default)
    textbounds    -- Vector2.   NEEDED (no default)
    font          -- i32/number NEEDED (no default)
})
```

#### example
```lua
drawing.new("text", {
    text = "hello world",
    font = 2,
    outline = true,
    size = 16,
    textbounds = Vector2.new(100, 100),
    position = Vector2.new(20, 20)
})
```
