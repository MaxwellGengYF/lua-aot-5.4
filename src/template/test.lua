local v0 = 0
local v1 = 1


for i = 1, 50000, 1 do
    local new_var = v0 + v1
    v0 = v1
    v1 = new_var
end