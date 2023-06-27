local http = require("socket.http")
local json = require("cjson")

function fetchJSON(url)
  local response, status, headers = http.request(url)
  if status == 200 then
    return response
  else
    return nil, "Failed to fetch JSON: " .. status
  end
end

local apiUrl = "https://dummyjson.com/products/1"

local jsonData, error = fetchJSON(apiUrl)
if jsonData then
  local decodedData = json.decode(jsonData)

  if decodedData and type(decodedData) == "table" then
    print("JSON data:")
    for key, value in pairs(decodedData) do
      print(key, value)
    end
  else
    print("Failed to parse JSON data.")
  end
else
  print("Error:", error)
end
