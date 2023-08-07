local handle = io.popen("ls -lrt")
local result = handle:read("*a")
print(result)
handle:close()
