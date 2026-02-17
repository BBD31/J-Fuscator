local VM = {}
VM.__index = VM

function VM:new(seed)
    local self = setmetatable({}, VM)
    self.seed = seed or os.time()
    math.randomseed(self.seed)
    self.opcodes = {
        LOADK = math.random(1000,9999),
        CALL = math.random(1000,9999),
        RETURN = math.random(1000,9999),
        GETGLOBAL = math.random(1000,9999),
        SETGLOBAL = math.random(1000,9999),
        MOVE = math.random(1000,9999),
        TAILCALL = math.random(1000,9999),
        JMP = math.random(1000,9999),
        EQ = math.random(1000,9999),
        LT = math.random(1000,9999),
        LE = math.random(1000,9999)
    }
    local _r = math.random
    math.random = function(a,b)
        a = a or 0
        b = b or 1
        if a > b then a,b = b,a end
        if a == b then return a end
        return _r(a,b)
    end
    return self
end

function VM:execute(bytecode)
    local ip = 1
    while ip <= #bytecode do
        local instr = bytecode[ip]
        ip = ip + 1
    end
end

return VM
