local Core = require("core")

local args = {...}
if #args < 1 then
    print("Usage: lua run.lua <input.lua>")
    return
end

local inputFile = args[1]
local outputFile = "out.lua"

local f = io.open(inputFile,"r")
if not f then
    print("File not found: "..inputFile)
    return
end
local code = f:read("*a")
f:close()

local core = Core:new()
local obfuscated = core:obfuscate(code)

local out = io.open(outputFile,"w")
out:write(obfuscated)
out:close()

print("Obfuscated script written to "..outputFile)
