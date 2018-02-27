local inet = require("internet")
local json = require("json")

local inetutils = {}

function inetutils.encodeJson(data)
  return json.encode(data)
end

function inetutils.decodeJson(data)
  return json.decode(data)
end

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

function inetutils.getJson(url)
  local req = inet.request(url)
  local body = ""
  if req then
    for line in req do
      body = body .. line
    end
  end
  return jsonDecode(body)
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

function inetutils.postJson(url, data)
  local req = inet.request(url, data)
  local body = ""
  if req then
    for line in req do
      body = body .. line
    end
  end
  return jsonDecode(body)
end

return inetutils