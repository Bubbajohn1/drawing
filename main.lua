local drawing = {
    screen_instance = nil,
    drawings = {},
    instance = {},
    Fonts = {
        [0] = nil,
        [1] = Enum.Font.Arial,
        [2] = Enum.Font.Code,
        [3] = Enum.Font.Roboto
    }
}
-- idk what index does but it does somethingn
drawing.__index = drawing

drawing.drawings.__index = drawing.drawings
drawing.instance.__index = drawing.instance

function drawing.instance.new(ins, properties)
    local obj = Instance.new(ins)

    for i, v in properties do
        obj[i] = v
    end

    return obj
end

function drawing:createcontext()
    self.screen_instance = self.instance.new("ScreenGui", {
        ResetOnSpawn = false,
        Name = "vamp_drawing"
    })
    -- syn.protect_gui(GUI)
    self.screen_instance.Parent = game:GetService("StarterGui") -- syn docs say to parent gui after protect_gui is called
end

function drawing.new(type, properties)
    -- default values
    local visible = properties.visible or true
    local zindex = properties.zindex or 0
    local transparency = properties.transparency or 0
    local color = properties.color or Color3.fromRGB(255, 255, 255)

    local options = {
        ["line"] = function()
            local thickness = properties.thickness or 1
            local to = properties.to
            local from = properties.from

            if from == nil or to == nil then
                return error("[ERROR]: no from or to given")
            end

            local function getValues()
                local diffVector = to - from
                local angle = math.atan2(diffVector.Y, diffVector.X)

                return {
                    size = math.abs(to.x - from.x),
                    rotation = math.deg(angle)
                }
            end

            local line_instance = drawing.instance.new("Frame", {
                Parent = drawing.screen_instance,
                BackgroundColor3 = color,
                Size = UDim2.new(0, thickness, 0, getValues().size),
                BorderSizePixel = 0,
                Visible = visible,
                Transparency = transparency,
                Rotation = getValues().rotation,
                Position = UDim2.new(0, from.x, 0, from.y),
                ZIndex = zindex,
                Name = "line"
            })

            table.insert(drawing.drawings, {
                type = "line",
                properties = properties,
                instance = line_instance
            })

            local a = {}

            function a:Remove()
                line_instance:Destroy()
            end

            return {
                instance = line_instance,
                remove = a,
                properties = properties
            }
        end,

        ["text"] = function()
            local property_font = properties.Font
            
            local text_font = drawing.Fonts[property_font]
        end,

        ["image"] = function()

        end,

        ["circle"] = function()

        end,

        ["square"] = function()

        end,

        ["quad"] = function()

        end
    }

    local obj = nil

    for i, v in pairs(options) do
        if tostring(type) == i then
            obj = options[i]()
        end
    end

    if obj == nil then
        return error("[ERROR]: type: " .. tostring(type) .. " in not a valid drawing type.")
    else
        return obj
    end
end

drawing:createcontext()

drawing.new("line", {
    visible = true,
    zindex = 0,
    thickness = 1,
    color = Color3.fromRGB(200, 0, 0),

    from = Vector2.new(100, 100),
    to = Vector2.new(200, 200)
})


return drawing
