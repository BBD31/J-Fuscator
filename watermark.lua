local Watermark = {}
Watermark.__index = Watermark

function Watermark:add(script)
    local mark = "--wm:"..tostring(math.random(1000,9999))
    return mark..script
end

return Watermark
