local Renamer = require("renamer")
local VM = require("vm")
local Base64 = require("base64")
local Compiler = require("compiler")
local Watermark = require("watermark")

local Core = {}
Core.__index = Core

function Core:new()
    local self = setmetatable({}, Core)
    self.seed = os.time()
    self.vm = VM:new(self.seed)
    return self
end

function Core:obfuscate(script)
    local renamed = Renamer:rename(script,self.seed)
    local compiled = Compiler:compile(renamed,self.vm)
    local encoded = Base64:encode(string.char(table.unpack(compiled)))
    local marked = Watermark:add(encoded)
    return marked
end

return Core
