local Renamer = {}
Renamer.__index = Renamer

function Renamer:new()
    local self = setmetatable({}, Renamer)
    self.chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return self
end

function Renamer:randomName(length)
    local s = ""
    for i=1,length do
        local idx = math.random(1,#self.chars)
        s = s .. self.chars:sub(idx,idx)
    end
    return s
end

function Renamer:rename(script,seed)
    math.randomseed(seed or os.time())
    local renamed = script:gsub("([_%a][_%w]*)",function(var)
        return self:randomName(math.random(4,10))
    end)
    return renamed
end

return Renamer
