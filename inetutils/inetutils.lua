local inet = require("internet")
local jsonutils = require("json")

local inetutils = {}

function inetutils.get(url)
  local req = inet.request(url)
  local body = ""
  if req then
    for line in req do
      body = body .. line .. "\n"
    end
  end
  return body
end

function inetutils.post(url, data)
  local req = inet.request(url, data)
  local body = ""
  if req then
    for line in req do
      body = body .. line .. "\n"
    end
  end
  return body
end

function inetutils.encodeJson(data)
  return jsonutils.encode(data)
end

function inetutils.decodeJson(data)
  return jsonutils.decode(data)
end

return inetutils