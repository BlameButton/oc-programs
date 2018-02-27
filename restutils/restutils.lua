local inet = require("internet")
local json = require("json")

local restutils = {}

function restutils.encodeJson(data)
  return json.encode(data)
end

function restutils.decodeJson(data)
  return json.decode(data)
end

function restutils.get(url)
  local req = inet.request(url)
  local body = ""
  if req then
    for line in req do
      body = body .. line .. "\n"
    end
  end
  return body
end

function restutils.getJson(url)
  local req = inet.request(url)
  local body = ""
  if req then
    for line in req do
      body = body .. line
    end
  end
  return restutils.decodeJson(body)
end

function restutils.post(url, data)
  local req = inet.request(url, data)
  local body = ""
  if req then
    for line in req do
      body = body .. line .. "\n"
    end
  end
  return body
end

function restutils.postJson(url, data)
  local req = inet.request(url, data)
  local body = ""
  if req then
    for line in req do
      body = body .. line
    end
  end
  return restutilsdecodeJson(body)
end

return restutils