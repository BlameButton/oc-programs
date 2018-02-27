local inet = require("internet")

local inet-utils = {}

global function inet-utils.get(url)
  local req = inet.request(url)
  local body = ""
  if (req) then
    for line in req do
      body = body .. line .. "\n"
    end
  end
  return body
end

global function inet-utils.post(url, data)
  local req = inet.request(url, data)
  local body = ""
  if (req) then
    for line in req do
      body = body .. line .. "\n"
    end
  end
  return body
end

return inet-utils