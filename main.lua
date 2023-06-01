local drawing = {
    screen_instance = nil,


    drawings = {},
    singals = {},
    utility = {},


    instance = {},
    Fonts = {
        [0] = Enum.Font.Roboto,
        [1] = Enum.Font.Arial,
        [2] = Enum.Font.Code,
        [3] = Enum.Font.RobotoMono
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
            local thickness: number = properties.thickness or 1
            local to: Vector2 = properties.to
            local from: Vector2 = properties.from

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
                BackgroundTransparency = transparency,
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
            local text: string = properties.text or "label"
            local size: number = properties.size or 16
            local center: boolean = properties.center or false
            local outline: boolean = properties.outline or false
            local outline_color: Color3 = properties.outline_color or Color3.fromRGB(0, 0, 0)

            local position: Vector2 = properties.position
            local textbounds: Vector2 = properties.textbounds or Vector2.new(100, 100)
            local text_font: Font = drawing.Fonts[properties.font]

            if not position then
                return error("[ERROR]: No Position given.")
            elseif not textbounds then
                return error("[ERROR]: No Textbounds given.")
            elseif not text_font then 
                return error("[ERROR]: font: " .. tostring(properties.font) .. " is not a valid font or there was an error finding the font.")
            end

            local text_instance: TextLabel = drawing.instance.new("TextLabel", {
                Parent = drawing.screen_instance,
                Text = text,
                TextSize = size,
                TextColor3 = color,
                Size = UDim2.new(0, textbounds.X, 0, textbounds.Y),
                TextStrokeColor3 = outline_color,
                Font = text_font,
                BackgroundTransparency = 1,
                Position = UDim2.new(0, position.X, 0, position.Y),
                ZIndex = zindex,
                
                Visible = visible
            })

            if center then
                text_instance.TextXAlignment = Enum.TextXAlignment.Center
            end

            if outline then
                text_instance.TextStrokeTransparency = 0
            end

            table.insert(drawing.drawings, {
                type = "text",
                properties = properties,
                instance = text_instance
            })

            local a = {}

            function a:Remove()
                text_instance:Destroy()
            end

            return {
                instance = text_instance,
                remove = a,
                properties = properties
            }
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

drawing.new("text", {
    font = 2,
    outline = true,
    size = 16,
    textbounds = Vector2.new(100, 100),
    position = Vector2.new(20, 20)
})


return drawing
