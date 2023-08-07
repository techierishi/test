local json = require("json")
local http = require("http")
	
function main()
	local response, err = http.request("GET", "https://reqres.in/api/users?page=2")
	if err then
		return nil, err
	end
	local res = response.body

	local jsonObj = json.decode(res)
	local jsonStr = json.encode(jsonObj["data"])

	print("Hello world")
	print(jsonStr)

	return jsonStr
end

main()
